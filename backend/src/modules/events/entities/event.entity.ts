import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  OneToOne,
  ManyToOne,
  OneToMany,
  JoinColumn,
  RelationId,
} from 'typeorm';

import { EventRequest } from './event-request.entity';
import { Room } from './room.entity';
import { Post } from '../../community/entities/post.entity';
import { InstitutionEvent } from './institution-event.entity';

@Entity({ name: 'event' })
export class Event {
  @PrimaryGeneratedColumn('uuid')
  id!: string;

  @OneToOne(() => EventRequest, (req) => req.event, {
    onDelete: 'RESTRICT',
    nullable: true,
  })
  @JoinColumn({ name: 'request_id' })
  request?: EventRequest | null;

  @RelationId((e: Event) => e.request)
  requestId?: string | null;

  @ManyToOne(() => Room, (room) => room.events, {
    onDelete: 'RESTRICT',
    nullable: true,
  })
  @JoinColumn({ name: 'room_id' })
  room?: Room | null;

  @RelationId((e: Event) => e.room)
  roomId?: string | null;

  @Column({ name: 'external_address', type: 'text', nullable: true })
  externalAddress?: string | null;

  @Column({ name: 'start_time', type: 'timestamptz' })
  startTime!: Date;

  @Column({ name: 'end_time', type: 'timestamptz' })
  endTime!: Date;

  @Column({ name: 'is_cancelled', type: 'boolean', default: false })
  isCancelled!: boolean;

  @Column({
    name: 'time_range',
    type: 'tstzrange',
    generatedType: 'STORED',
    asExpression: "tstzrange(start_time, end_time, '[)')",
  })
  timeRange!: string;

  @OneToOne(() => InstitutionEvent, (ie) => ie.event)
  institutionEvent?: InstitutionEvent;

  @OneToMany(() => Post, (post) => post.event)
  posts!: Post[];
}
