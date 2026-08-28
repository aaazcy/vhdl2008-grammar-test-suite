-- =============================================================
-- Case ID: TC_INDEX_CONSTRAINT_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_INDEX_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: index_constraint ::= ( discrete_range { , discrete_range } )
-- Case Type: Positive
-- Test Focus: SEMANTIC -- index_constraint ensures array bounds match at signal assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ic_sem_bounds is port(dout:out integer); end entity;
architecture rtl of ic_sem_bounds is
  type t_vec is array(integer range <>) of integer;
  subtype t_vec4 is t_vec(0 to 3);
  signal s:t_vec4:=(0,1,2,3); signal r:integer:=0;
begin process begin for i in 0 to 3 loop r<=r+s(i); end loop; dout<=r; wait; end process; end architecture;