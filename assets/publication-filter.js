(function () {
  var DEFAULT_FROM = 2019;
  var DEFAULT_TO = 2026;

  var state = {
    role: "all",
    from: DEFAULT_FROM,
    to: DEFAULT_TO,
  };

  function itemYears(item) {
    var text = item.innerText || item.textContent || "";
    var matches = text.match(/20[0-9]{2}/g) || [];
    return matches.map(function (year) {
      return parseInt(year, 10);
    });
  }

  function rangeValue(input, fallback) {
    if (!input) return fallback;
    var value = parseInt(input.value, 10);
    return Number.isFinite(value) ? value : fallback;
  }

  function currentRange() {
    var from = state.from;
    var to = state.to;
    if (from > to) return { from: to, to: from };
    return { from: from, to: to };
  }

  function inDefaultRange() {
    return state.from === DEFAULT_FROM && state.to === DEFAULT_TO;
  }

  function itemInRange(item) {
    var years = itemYears(item);
    if (years.length === 0) return inDefaultRange();
    var range = currentRange();
    return years.some(function (year) {
      return year >= range.from && year <= range.to;
    });
  }

  function applyFilters() {
    var groups = document.querySelectorAll(".peer-group");
    groups.forEach(function (group) {
      var visibleItems = 0;
      var items = group.querySelectorAll("li");

      items.forEach(function (item) {
        var roleMatch = state.role === "all" || item.dataset.role === state.role;
        var yearMatch = itemInRange(item);
        item.hidden = !roleMatch || !yearMatch;
        if (roleMatch && yearMatch) visibleItems += 1;
      });

      group.hidden = items.length > 0 && visibleItems === 0;
    });

    updateControls();
  }

  function updateControls() {
    var rolePills = document.querySelectorAll(".pub-role-pill");
    var fromInput = document.getElementById("pub-year-from");
    var toInput = document.getElementById("pub-year-to");
    rolePills.forEach(function (pill) {
      pill.classList.toggle("is-active", pill.dataset.role === state.role);
    });
    if (fromInput) fromInput.value = state.from;
    if (toInput) toInput.value = state.to;
  }

  function syncRangeFromInputs() {
    state.from = rangeValue(document.getElementById("pub-year-from"), DEFAULT_FROM);
    state.to = rangeValue(document.getElementById("pub-year-to"), DEFAULT_TO);
    applyFilters();
  }

  function initPublicationFilter() {
    var rolePills = document.querySelectorAll(".pub-role-pill");
    rolePills.forEach(function (pill) {
      pill.addEventListener("click", function () {
        state.role = pill.dataset.role;
        applyFilters();
      });
    });

    ["pub-year-from", "pub-year-to"].forEach(function (id) {
      var input = document.getElementById(id);
      if (!input) return;
      input.addEventListener("input", syncRangeFromInputs);
      input.addEventListener("change", syncRangeFromInputs);
    });

    var reset = document.getElementById("pub-filter-reset");
    if (reset) {
      reset.addEventListener("click", function () {
        state.role = "all";
        state.from = DEFAULT_FROM;
        state.to = DEFAULT_TO;
        applyFilters();
      });
    }

    applyFilters();
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", initPublicationFilter);
  } else {
    initPublicationFilter();
  }
})();
