import { Component, Input, Inject	 } from '@angular/core';
import { TrainerService } from './trainers.service';
import {FormBuilder, FormGroup, FormControl, Validators} from '@angular/forms';

@Component({
	selector: 'trainers',
	providers: [TrainerService],
	templateUrl: './template/trainers.component.html',
	styles: [`
		table, td {
   		border: 1px solid black;
   		text-align: center;
		}
		table{
			width: 500px;
		}
		input{
		  width: 345px;
		}
	`]
})
export class TrainersComponent  {
	trainers: any;
	selected: number;
	first_names: string;
	team_name: string;
	newMember: any;
	first_name = new FormControl('',[
		Validators.required
	]);
	last_name = new FormControl('',[
		Validators.required
	]);
	birthday = new FormControl('');
	team = new FormControl('',[
		Validators.required
	]);
	email = new FormControl('');
	github = new FormControl('',[
		Validators.required
	]);
  
	trainerForm: any;
	constructor(private _trainer: TrainerService, private _builder: FormBuilder){
		this.trainers = [];
		// this._trainer.getAllTrainer()
		// .subscribe((data :any) => {
		// 	this.trainers = data.trainers;
		// });
		this.trainerForm = this._builder.group({
    first_name: this.first_name,
    last_name: this.last_name,
    birthday: this.birthday,
    team: this.team,
    email: this.email,
    github: this.github,
  	});
		this.team_name = 'load';
		this.newMember = {
			first_name: '',
			last_name: '',
			birthday: '',
			email: '',
			github: ''
		};

	this.first_name.valueChanges
	.subscribe(formData => {
		this.updateEmail();
	});

	this.last_name.valueChanges
	.subscribe(formData => {
		this.updateEmail();
	});
	}

	show(index: number){
		this.selected = index;
	}

	addMember(){
		this.newMember = (this.trainerForm.value);
		this.trainers.push(this.newMember);
	}

	updateEmail(){
		var email = this.first_name.value + '.' + this.last_name.value + '@asiantech.vn';
		this.email.setValue(email);
	}

}