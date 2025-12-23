import { Entity, Column, OneToOne, JoinColumn, PrimaryColumn } from 'typeorm';
import { Event } from './event.entity';
import { EventType } from '../entities/enums/event-type.enum';

@Entity({ name: 'institution_event' })
export class InstitutionEvent {
  @PrimaryColumn('uuid', { name: 'event_id' })
  eventId!: string;

  @OneToOne(() => Event, (event) => event.institutionEvent, {
    onDelete: 'CASCADE',
  })
  @JoinColumn({ name: 'event_id' })
  event!: Event;

  @Column({ type: 'text' })
  title!: string;

  @Column({ type: 'text', nullable: true })
  description?: string | null;

  @Column({
    name: 'event_type',
    type: 'enum',
    enum: EventType,
    enumName: 'event_type',
  })
  eventType!: EventType;
}
