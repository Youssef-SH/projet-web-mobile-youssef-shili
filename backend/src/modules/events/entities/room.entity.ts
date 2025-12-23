import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from 'typeorm';
import { EventRequest } from './event-request.entity';
import { Event } from './event.entity';

@Entity({ name: 'room' })
export class Room {
  @PrimaryGeneratedColumn('uuid')
  id!: string;

  @Column({ type: 'text' })
  name!: string;

  @Column({ name: 'is_archived', type: 'boolean', default: false })
  isArchived!: boolean;

  @OneToMany(() => EventRequest, (req) => req.room)
  requests!: EventRequest[];

  @OneToMany(() => Event, (event) => event.room)
  events!: Event[];
}
