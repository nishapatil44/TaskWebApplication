<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Project;
use App\Models\Task;

class TaskController extends Controller
{
    public function index()
    {
        $tasks = Task::select('id','name','hours','project_code')->get()->toArray();
        return view('task_list_view', compact('tasks'));
    }

    public function create()
    {
        $projects = Project::select('id','name')->get();
        return view('add_task_view',compact('projects'));
    }

    public function store(Request $request)
    {
        $name = $request->input()['name'];
        Task::create([
            "name" => $name,
            "hours" => $request->input()['hours'],
            "project_code" => $request->input()['project'],
        ]);
        return redirect()->route('tasks.list');
    }

    public function update(Request $request)
    {
        $name = $request->input()['name'];
        $id = $request->input()['id'];
        $project = Task::findOrFail($id);
        $project->update([
            "name" => $name
        ]);
        return redirect()->route('tasks.list');
    }

    public function edit(int $id)
    {
        $task = Task::findOrFail($id);
        $project_name = Project::select('name')->where('id',$task->project_code)->first();
        $project_name = $project_name->name;
        $projects = Project::select('id','name')->get();
        return view('edit_task_view',compact('task','project_name','projects'));
    }

    public function destroy($id)
    {
        $task = Task::find($id);
        $task->delete();
        return redirect()->route('tasks.list');
    }
}

