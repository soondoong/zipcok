    const today = new Date();

    const setCalendarData = (year, month) => {
      let calHtml = "";
      const setDate = new Date(year, month - 1, 1);
      const firstDay = setDate.getDate();
      const firstDayName = setDate.getDay();
      const lastDay = new Date(today.getFullYear(), today.getMonth() + 1, 0).getDate();
      const prevLastDay = new Date(today.getFullYear(), today.getMonth(), 0).getDate();

      let startDayCount = 1;
      let lastDayCount = 1;

      for (let i = 0; i < 6; i++) {
        for (let j = 0; j < 7; j++) {
          if (i == 0 && j < firstDayName) {
            if (j == 0) {
              calHtml +=
                `<div><span>${(prevLastDay - (firstDayName - 1) + j)}</span><span></span></div>`;
            } else if (j == 6) {
              calHtml +=
                `<div><span>${(prevLastDay - (firstDayName - 1) + j)}</span><span></span></div>`;
            } else {
              calHtml +=
                `<div><span>${(prevLastDay - (firstDayName - 1) + j)}</span><span></span></div>`;
            }
          }
          else if (i == 0 && j == firstDayName) {
            //일요일일 때, 토요일일 때, 나머지 요일 일 때
            if (j == 0) {
              calHtml +=
                `<div><span>${startDayCount}</span><span id='${year}${month}${setFixDayCount(startDayCount++)}'></span></div>`;
            } else if (j == 6) {
              calHtml +=
                `<div><span>${startDayCount}</span><span id='${year}${month}${setFixDayCount(startDayCount++)}'></span></div>`;
            } else {
              calHtml +=
                `<div><span>${startDayCount}</span><span id='${year}${month}${setFixDayCount(startDayCount++)}'></span></div>`;
            }
          }
          else if (i == 0 && j > firstDayName) {
            if (j == 0) {
              calHtml +=
                `<div><span>${startDayCount}</span><span id='${year}${month}${setFixDayCount(startDayCount++)}'></span></div>`;
            } else if (j == 6) {
              calHtml +=
                `<div><span>${startDayCount}</span><span id='${year}${month}${setFixDayCount(startDayCount++)}'></span></div>`;
            } else {
              calHtml +=
                `<div><span>${startDayCount}</span><span id='${year}${month}${setFixDayCount(startDayCount++)}'></span></div>`;
            }
          }
          else if (i > 0 && startDayCount <= lastDay) {
            if (j == 0) {
              calHtml +=
                `<div><span>${startDayCount}</span><span id='${year}${month}${setFixDayCount(startDayCount++)}'></span></div>`;
            } else if (j == 6) {
              calHtml +=
                `<div><span>${startDayCount}</span><span id='${year}${month}${setFixDayCount(startDayCount++)}'></span></div>`;
            } else {
              calHtml +=
                `<div><span>${startDayCount}</span><span id='${year}${month}${setFixDayCount(startDayCount++)}'></span></div>`;
            }
          }
          else if (startDayCount > lastDay) {
            if (j == 0) {
              calHtml +=
                `<div><span>${lastDayCount++}</span><span></span></div>`;
            } else if (j == 6) {
              calHtml +=
                `<div><span>${lastDayCount++}</span><span></span></div>`;
            } else {
              calHtml +=
                `<div><span>${lastDayCount++}</span><span></span></div>`;
            }
          }
        }
      }
      document.querySelector("#calendar").insertAdjacentHTML("beforeend", calHtml);
    };
    const setFixDayCount = number => {
      let fixNum = "";
      if (number < 10) {
        fixNum = "0" + number;
      } else {
        fixNum = number;
      }
      return fixNum;
    };
    if (today.getMonth() + 1 < 10) {
      setCalendarData(today.getFullYear(), "0" + (today.getMonth() + 1));
    } else {
      setCalendarData(today.getFullYear(), "" + (today.getMonth() + 1));
    }