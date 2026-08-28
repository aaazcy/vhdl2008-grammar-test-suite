-- =============================================================
-- Case ID: TC_SECONDARY_UNIT_DECLARATION_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_SECONDARY_UNIT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: secondary_unit_declaration ::= identifier = physical_literal ;
-- Case Type: Positive
-- Test Focus: SEMANTIC -- secondary unit name tested in relational comparison with unit literal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sud_sem_compare is port(dout:out integer); end entity;
architecture rtl of sud_sem_compare is
  type t_len is range 0 to 100000 units um; mm=1000 um; cm=10 mm; end units;
  signal s_val:t_len:=1 mm; signal s_res:integer:=0;
begin process begin if s_val < 1 cm then s_res<=1; end if; dout<=s_res; wait; end process; end architecture;