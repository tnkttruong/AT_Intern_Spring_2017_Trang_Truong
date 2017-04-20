import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import { Observable } from 'rxjs/Observable';

import 'rxjs/add/operator/map';

@Injectable()

export class TrainerService{
	trainers: any[];
	constructor(private _http: Http){
		this.trainers = [];
	}

	getAllTrainer(){
		return this._http.get('./data/trainers.json')
    .map((res :any) => {
      return res.json();
    });
	}
}