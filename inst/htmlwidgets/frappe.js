HTMLWidgets.widget({

  name: 'frappe',

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
                      name: x.options.seriesname,
                      type: x.type,
                      values: x.data
                  }
              ]
          }

        const chart = new frappe.Chart(el, {
          title: x.options.title,
          data: data,
          type: x.type, // or 'bar', 'line', 'scatter', 'pie', 'percentage'
          height: 500,
          colors: x.options.colors,
          barOptions: {
              stacked: true,
              height: 85,
              spaceRatio: 0.5
          }
        })

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
