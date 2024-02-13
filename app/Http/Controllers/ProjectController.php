<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Project;

class ProjectController extends Controller
{
    public function index()
    {
        $projects = Project::select('id','name')->get()->toArray();
        return view('project_list_view', compact('projects'));
    }

    public function create()
    {
        return view('add_project_view');
    }

    public function store(Request $request)
    {
        $name = $request->input()['name'];
        Project::create([
            "name" => $name
        ]);
        return redirect()->route('projects.list');
    }

    public function update(Request $request)
    {
        $name = $request->input()['name'];
        $id = $request->input()['id'];
        $project = Project::findOrFail($id);
        $project->update([
            "name" => $name
        ]);
        return redirect()->route('projects.list');
    }

    public function edit($id)
    {
        $project = Project::findOrFail($id)->toArray();
        return view('edit_project_view',compact('project'));
    }

    public function destroy($id)
    {
        $project = Project::find($id);
        $project->delete();
        return redirect()->route('projects.list');
    }
}
