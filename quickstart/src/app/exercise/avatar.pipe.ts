import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
	name: 'avatar',
})

export class AvatarDemoPiPe implements PipeTransform {
	constructor(){
	}
  transform(value: string): string{
  	if ( value === '' ){
  		return "default avatar";
  	}else{
  		return value;
  	}
  }
}