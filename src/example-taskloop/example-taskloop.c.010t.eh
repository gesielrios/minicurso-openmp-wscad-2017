
;; Function func (func, funcdef_no=2, decl_uid=3553, cgraph_uid=2, symbol_order=2)

func ()
{
  struct _IO_FILE * stdout.1;
  int D.3571;
  long int D.3570;
  long unsigned int D.3569;
  int j;
  int i;
  struct _IO_FILE * stdout.0;
  int D.3567;
  long int D.3566;
  long unsigned int D.3565;
  struct  .omp_data_o.3;
  long int D.3574;
  long int D.3573;

  D.3565 = pthread_self ();
  D.3566 = (long int) D.3565;
  D.3567 = omp_get_thread_num ();
  stdout.0 = stdout;
  fprintf (stdout.0, "Thread[%lu,%lu]: taskloop...\n", D.3567, D.3566);
  #pragma omp taskloop grainsize(2) num_tasks(8)
  for (i = 0; i <= 15; i = i + 1)
  #pragma omp taskloop _looptemp_(D.3574) _looptemp_(D.3573) private(j) private(i) [child fn: func._omp_fn.0 (.omp_data_o.3)]
  .omp_data_i = (struct  & restrict) &.omp_data_o.3;
  D.3580 = .omp_data_i->D.3579;
  D.3582 = .omp_data_i->D.3581;
  #pragma omp taskloop _looptemp_(D.3580) _looptemp_(D.3582)
  for (i = 0; i <= 15; i = i + 1)
  j = 0;
  goto <D.3585>;
  <D.3586>:
  D.3569 = pthread_self ();
  D.3570 = (long int) D.3569;
  D.3571 = omp_get_thread_num ();
  stdout.1 = stdout;
  fprintf (stdout.1, "Thread[%lu,%lu]: Trabalhando na iteração (%d,%d).\n", D.3571, D.3570, i, j);
  j = j + 1;
  <D.3585>:
  if (j < i) goto <D.3586>; else goto <D.3587>;
  <D.3587>:
  #pragma omp continue (i, i)
  #pragma omp return
  #pragma omp continue (0, 0)
  #pragma omp return
  .omp_data_o.3 = {CLOBBER};
  #pragma omp continue (i, i)
  #pragma omp return
  return;
}



;; Function main (main, funcdef_no=3, decl_uid=3562, cgraph_uid=3, symbol_order=3)

main (int argc, char * * argv)
{
  _Bool D.3640;
  int D.3624;
  struct _IO_FILE * stdout.8;
  long int D.3622;
  int D.3621;
  long int D.3620;
  long unsigned int D.3619;
  struct _IO_FILE * stdout.4;
  long int D.3604;
  int D.3603;
  long int D.3602;
  long unsigned int D.3601;

  D.3601 = pthread_self ();
  D.3602 = (long int) D.3601;
  D.3603 = omp_get_thread_num ();
  D.3604 = (long int) D.3603;
  stdout.4 = stdout;
  fprintf (stdout.4, "Thread[%lu,%lu]: Antes da Região Paralela.\n", D.3604, D.3602);
  #pragma omp parallel num_threads(4) [child fn: main._omp_fn.1 (???)]
  #pragma omp single
  D.3640 = __builtin_GOMP_single_start ();
  if (D.3640 == 1) goto <D.3638>; else goto <D.3639>;
  <D.3638>:
  D.3606 = pthread_self ();
  D.3607 = (long int) D.3606;
  D.3608 = omp_get_thread_num ();
  D.3609 = (long int) D.3608;
  stdout.5 = stdout;
  fprintf (stdout.5, "  Thread[%lu,%lu]: Antes das tasks.\n", D.3609, D.3607);
  #pragma omp taskgroup
  __builtin_GOMP_taskgroup_start ();
  #pragma omp task [child fn: main._omp_fn.2 (???)]
  D.3611 = pthread_self ();
  D.3612 = (long int) D.3611;
  D.3613 = omp_get_thread_num ();
  stdout.6 = stdout;
  fprintf (stdout.6, "Thread[%lu,%lu]: Trabalhando na task avulsa.\n", D.3613, D.3612);
  #pragma omp continue (0, 0)
  #pragma omp return
  #pragma omp task [child fn: main._omp_fn.3 (???)]
  D.3615 = pthread_self ();
  D.3616 = (long int) D.3615;
  D.3617 = omp_get_thread_num ();
  stdout.7 = stdout;
  fprintf (stdout.7, "Thread[%lu,%lu]: Trabalhando na task func().\n", D.3617, D.3616);
  func ();
  #pragma omp continue (0, 0)
  #pragma omp return
  __builtin_GOMP_taskgroup_end ();
  #pragma omp return(nowait)
  <D.3639>:
  #pragma omp return
  #pragma omp return
  D.3619 = pthread_self ();
  D.3620 = (long int) D.3619;
  D.3621 = omp_get_thread_num ();
  D.3622 = (long int) D.3621;
  stdout.8 = stdout;
  fprintf (stdout.8, "Thread[%lu,%lu]: Depois da Região Paralela.\n", D.3622, D.3620);
  D.3624 = 0;
  goto <D.3641>;
  D.3624 = 0;
  goto <D.3641>;
  <D.3641>:
  return D.3624;
}


