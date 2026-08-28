-- =============================================================
-- Case ID: TC_TYPE_DECLARATION_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_TYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Production: type_declaration ::= full_type_declaration | incomplete_type_declaration
-- Case Type: Positive
-- Test Focus: SEMANTIC -- type declared in package and used across design
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity td_sem_pkg is port(dout:out integer); end entity;
architecture rtl of td_sem_pkg is
  package p is type t_data is array(0 to 3) of integer; end package;
  signal s:p.t_data:=(0,1,2,3);
begin dout<=s(0)+s(3); end architecture;