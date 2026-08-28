-- =============================================================
-- Case ID: TC_SEM_ASP_001_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_ASP_001
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Rule Description: All concurrent statement drives in the architecture statement part must be legal - compilation passes when there is no multi-driver conflict
-- Case Type: Positive
-- Error Category: assignment_driver_violation
-- Test Focus: Positive case: 4 different signals (s_and/s_or/s_xor/s_out) are each driven by a different concurrent statement (3 component insts + 1 concurrent assign), each signal has exactly one driver, verifying multiple concurrent statements driving different signals is legal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity asp_sem_ent is port(a,b:in bit; y:out bit); end entity;
architecture bh of asp_sem_ent is
  signal s1,s2,s3:bit;
begin
  s1<=a and b; s2<=a or b; s3<=a xor b;
  y<=s1 xor s2 xor s3;
end architecture bh;
