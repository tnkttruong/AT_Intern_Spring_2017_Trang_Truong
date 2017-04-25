import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
	name: 'member',
})

export class MemberDemoPiPe implements PipeTransform {
	constructor(){
	}
  transform(trainers: any, team_name: string): any{
    if (team_name === "All"){
      return trainers;
    }else{
      var new_trainers = [];
      for (let trainer of trainers) {
        if(trainer.team === team_name){
          new_trainers.push(trainer);
        }
      }
      return new_trainers;
    }
  }
}