$(document).on('click', '.load-section', function() {
    var section = $(this).data('section');
    var projectId = $(this).closest('.container').data('project-id'); // Ensure the container has a data attribute for project ID

    $.ajax({
      url: '/projects/' + projectId + '/load_section',
      data: { section: section },
      dataType: 'script'
    });

    // Remove active class from all buttons and set them to outline-secondary
    $('.load-section').removeClass('btn-secondary').addClass('btn-outline-secondary');

    // Add active class to the clicked button
    $(this).removeClass('btn-outline-secondary').addClass('btn-secondary');
});
