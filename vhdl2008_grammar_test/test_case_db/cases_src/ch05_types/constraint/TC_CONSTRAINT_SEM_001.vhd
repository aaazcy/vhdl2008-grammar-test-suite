-- =============================================================
-- Case ID: TC_CONSTRAINT_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2
-- Production: constraint ::= range_constraint | array_constraint | record_constraint
-- Case Type: Positive
-- Test Focus: SEMANTIC -- constraint range bounds checked at elaboration, valid range
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity con_sem_range_ok is port(dout:out integer); end entity;
architecture rtl of con_sem_range_ok is
  subtype t_nibble is integer range 0 to 15;
  signal s:t_nibble:=0; signal r:integer:=0;
begin process begin for i in 0 to 15 loop s<=i; r<=r+s; end loop; dout<=r; wait; end process; end architecture;