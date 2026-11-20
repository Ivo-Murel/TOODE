# ============================================================
# DACA – Nädal 8: Python API-d ja automatiseerimine
# GRUPITÖÖ – ROLL C: Visualization + Saving
# Fail: visualize_export.py
#
# Ülesanne:
# Visualiseerida rolli B töödeldud müügiandmed Plotly abil
# ning salvestada analüüsitulemused CSV- ja HTML-failidesse.
#
# Sisend:
# Rolli B (transform.py) koostatud nädalaandmed ja KPI-d.
#
# Väljund:
# Müügidiagramm, KPI-de ülevaade ja eksporditud failid.
#
# See moodul ühendatakse hiljem rolli D pipeline.py failiga.
# ============================================================

import plotly.express as px
import plotly.graph_objects as go
from plotly.subplots import make_subplots

def create_weekly_chart(df_weekly):
    """Loob nädalase müügitulu joondiagrammi."""
    fig = px.line(
        df_weekly,
        x="sale_date",
        y="total_revenue",
        title="Nädalane müügitulu"
    )
    return fig


def create_kpi_summary(kpis):
    """Loob peamiste KPI-de ülevaate Plotly abil."""
    fig = make_subplots(
        rows=1,
        cols=3,
        specs=[[{"type": "indicator"}] * 3]
    )


    fig.add_trace(
        go.Indicator(
            mode="number",
            value=kpis["total_revenue"],
            number={"valueformat": ",.2f", "suffix": " €"},
            title={"text": "Müügitulu"}
        ),
        row=1,
        col=1
    )


    fig.add_trace(
        go.Indicator(
            mode="number",
            value=kpis["unique_customers"],
            number={"valueformat": ",.0f"},
            title={"text": "Unikaalsed kliendid"}
        ),
        row=1,
        col=2
    )


    fig.add_trace(
        go.Indicator(
            mode="number",
            value=kpis["avg_order_value"],
            number={"valueformat": ",.2f", "suffix": " €"},
            title={"text": "Keskmine tellimus"}
        ),
        row=1,
        col=3
    )


    fig.update_layout(
        title="Müügi põhinäitajad (KPI)",
        height=350,
        template="plotly_white",
        margin=dict(l=30, r=30, t=90, b=30)
    )

    return fig


def export_results(df, output_dir, kpis):
    """Salvestab CSV-aruande ja Plotly diagrammid HTML-failidena."""
    from pathlib import Path
    from datetime import datetime

    output_path = Path(output_dir)
    output_path.mkdir(parents=True, exist_ok=True)

    kuupaev = datetime.now().strftime("%Y%m%d")

    # Salvestame nädalase müügiaruande CSV-failina.
    csv_fail = output_path / f"weekly_report_{kuupaev}.csv"
    df.to_csv(csv_fail, index=False)

    # Salvestame nädalase müügitulu diagrammi HTML-failina.
    weekly_fig = create_weekly_chart(df)
    weekly_fig.write_html(output_path / f"weekly_chart_{kuupaev}.html")
    

    # Loome KPI-diagrammi ja salvestame selle HTML-failina.
    kpi_fig = create_kpi_summary(kpis)
    kpi_fig.write_html(output_path / f"kpi_chart_{kuupaev}.html")

    return csv_fail
