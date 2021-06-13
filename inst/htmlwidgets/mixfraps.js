HTMLWidgets.widget({

  name: 'mixfraps',

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
                  },

                   {
                      name: x.options.series3name,
                      chartType: x.type3,
                      values: x.data3
                  },

              ]
          }

        const chart = new frappe.Chart(el, {
          title: x.options.title,
          data: data,
          type: 'axis-mixed',
          height: 550,
          colors: x.options.colors,
          lineOptions: {
            regionFill: 1 // default: 0
          },
          barOptions: {
              stacked: false,
              spaceRatio: 0.5
          },
          tooltipOptions: {
              formatTooltipX: (d) => (d + "").toUpperCase(),
              formatTooltipY: (d) => d + " Dollars"
          }
        })
      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
