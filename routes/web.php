<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProjectController;
use App\Http\Controllers\TaskController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });
// Route::get('/projects/create', function () {
//     return view('add_project_view');
// });
// Route::get('/projects/edit', function () {
//     return view('edit_project_view');
// });
Route::get('/projects/create',[ProjectController::class,'create'])->name('projects.create');
Route::get('/projects/{id}/edit',[ProjectController::class,'edit'])->name('projects.edit');
Route::get('/projects/{id}/delete',[ProjectController::class,'destroy'])->name('projects.delete');
Route::get('/projects/list',[ProjectController::class,'index'])->name('projects.list');
Route::post('/projects/store',[ProjectController::class,'store'])->name('projects.store');
Route::post('/projects/update',[ProjectController::class,'update'])->name('projects.update');

Route::get('/tasks/create',[TaskController::class,'create'])->name('tasks.create');
Route::get('/tasks/{id}/edit',[TaskController::class,'edit'])->name('tasks.edit');
Route::get('/tasks/{id}/delete',[TaskController::class,'destroy'])->name('tasks.delete');
Route::get('/tasks/list',[TaskController::class,'index'])->name('tasks.list');
Route::post('/tasks/store',[TaskController::class,'store'])->name('tasks.store');
Route::post('/tasks/update',[TaskController::class,'update'])->name('tasks.update');