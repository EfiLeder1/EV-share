
var events = [
    { Title: "Breakfast with Mom", Date: new Date("11/13/2012") },
    { Title: "Rachel's Birthday", Date: new Date("11/25/2012") },
    { Title: "Meeting with Client", Date: new Date("12/02/2012") }
];  


$('#datepicker').datepicker({  
      inline: true,  
       showOtherMonths: true,  
      dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
      beforeShowDay: function(date) {
          var result = [true, '', null];
          var matching = $.grep(events,     function(event) {
            return event.Date.valueOf() === date.valueOf();
        });
        
        if (matching.length) {
            result = [true, 'highlight', null];
        }
        return result;
    },
    onSelect: function(dateText) {
        var date,
            selectedDate = new Date(dateText),
            i = 0,
            event = null;
        
        while (i < events.length && !event) {
            date = events[i].Date;

            if (selectedDate.valueOf() === date.valueOf()) {
                event = events[i];
            }
            i++;
        }
        if (event) {
            alert(event.Title);
        }
    }  
 });  
/*The part of the script that attaches events to dates is borrowed from: http://jsfiddle.net/Zrz9t/1151/   */