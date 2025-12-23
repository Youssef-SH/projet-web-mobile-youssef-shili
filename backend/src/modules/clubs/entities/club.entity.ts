import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  OneToOne,
  OneToMany,
  JoinColumn,
} from 'typeorm';

import { User } from '../../auth/entities/user.entity';
import { ClubLeader } from './club-leader.entity';
import { Subscription } from './subscription.entity';
import { AnnualReport } from './annual-report.entity';
import { EventRequest } from '../../events/entities/event-request.entity';
import { Post } from '../../community/entities/post.entity';

@Entity({ name: 'club' })
export class Club {
  @PrimaryGeneratedColumn('uuid')
  id!: string;

  @OneToOne(() => User, { onDelete: 'RESTRICT' })
  @JoinColumn({ name: 'user_id' })
  user!: User;

  @Column({ name: 'user_id', type: 'uuid', unique: true })
  userId!: string;

  @Column({ type: 'text' })
  name!: string;

  @Column({ type: 'text' })
  description!: string;

  @Column({ name: 'logo_url', type: 'text' })
  logoUrl!: string;

  @OneToMany(() => ClubLeader, (leader) => leader.club)
  leaders!: ClubLeader[];

  @OneToMany(() => Subscription, (sub) => sub.club)
  subscriptions!: Subscription[];

  @OneToMany(() => AnnualReport, (report) => report.club)
  reports!: AnnualReport[];

  @OneToMany(() => EventRequest, (req) => req.club)
  eventRequests!: EventRequest[];

  @OneToMany(() => Post, (post) => post.club)
  posts!: Post[];
}
