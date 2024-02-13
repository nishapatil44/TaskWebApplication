<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>User Form</title>
</head>
<body>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h3 class="mb-0">Edit Task</h3>
                </div>
                
                <div class="card-body">
                    <div id="successMessage" class="alert alert-success" style="display: none;">
                        Task Updated successfully
                    </div>
                    <form method="post" action="/tasks/store" onsubmit="showSuccessMessage()">
                    @csrf
                        <div class="form-row">
                            <div class="form-group col-md-12">
                                <label for="name">Name:</label>
                                <input type="text" class="form-control" id="name" name="name" value="{{$task->name}}" required>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-12">
                                <label for="hours">Hours:</label>
                                <input type="text" class="form-control" id="hours" name="hours" value="{{$task->hours}}" required>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-12">
                                <label for="project">Select Project:</label>
                                <select name="project" class="form-control" id="project">
                                    <option value="{{$task->project_id}}">{{$project_name}}</option>
                                    @foreach ($projects as $key => $project)
                                        <option value="{{$project->id}}">{{$project->name}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    function showSuccessMessage(){
        document.getElementById('successMessage').style.display = 'block';
    }
    $(document).ready(function(){
        
        
    });

</script>
</body>
</html>
