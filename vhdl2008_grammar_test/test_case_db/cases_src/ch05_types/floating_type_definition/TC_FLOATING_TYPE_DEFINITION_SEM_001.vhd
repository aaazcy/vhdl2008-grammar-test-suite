-- =============================================================
-- Case ID: TC_FLOATING_TYPE_DEFINITION_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_FLOATING_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: floating_type_definition ::= range_constraint
-- Case Type: Positive
-- Test Focus: SEMANTIC -- floating type used in multiplication scaling
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ftd_sem_scale is port(dout:out integer); end entity;
architecture rtl of ftd_sem_scale is
  type t_factor is range 0.0 to 10.0;
  signal s:t_factor:=1.5; signal r:integer:=0;
begin
  process begin
    r<=integer(real(s)*3.0); dout<=r; wait;
  end process;
end architecture rtl;
