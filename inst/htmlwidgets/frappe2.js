HTMLWidgets.widget({

  name: 'frappe2',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

       renderValue: function(x) {

        // TODO: code to render the widget, e.g.
        el.innerText = x.data;

        const data = {

              labels: x.labels,

              datasets: [
                  {
                      name: x.options.series1name,
                      chartType: x.type1,
                      values: x.data1
                  },


                  {
                      name: x.options.series2name,
                      chartType: x.type2,
                      values: x.data2
                  }

              ]
          }

        const chart = new frappe.Chart(el, {
          title: x.options.title,
          data: data,
          type: 'axis-mixed',
          height: 500,
          colors: x.options.colors,
          lineOptions: {
            heatline: x.heat,
            spline: x.spline,
            xIsSeries: true,
            regionFill: x.shade // default: 0
          },
          barOptions: {
              stacked: true,
              height: 15,
              spaceRatio: 0.5
          },
          tooltipOptions: {
            formatTooltipX: (d) => (d + "").toUpperCase(),
            formatTooltipY: (d) => d + " Units"
        }

        })

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
