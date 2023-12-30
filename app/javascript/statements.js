document.addEventListener('DOMContentLoaded', function() {
  document.getElementById('add_statement_item_link').addEventListener('click', function(e) {
    e.preventDefault();

    var association = 'statement_items';
    var content = document.querySelector('#statement_items .nested-fields:first-child').cloneNode(true);

    var newIndex = document.querySelectorAll('.nested-fields').length;

    content.querySelectorAll('input, select').forEach(function(input) {
      var name = input.name.replace(/\[\d\]/, '[' + newIndex + ']');
      var id = input.id.replace(/_\d_/, '_' + newIndex + '_');

      input.name = name;
      input.id = id;
      input.value = '';
    });

    document.getElementById('statement_items').appendChild(content);
  });

  document.getElementById('statement_items').addEventListener('click', function(e) {
    if (e.target && e.target.matches('.remove-item')) {
      var item = e.target.closest('.nested-fields');

      var itemCount = document.querySelectorAll('.nested-fields:not([style="display: none;"])').length;
      if (itemCount > 1) {
        item.style.display = 'none';
      }
    }
  });
});
