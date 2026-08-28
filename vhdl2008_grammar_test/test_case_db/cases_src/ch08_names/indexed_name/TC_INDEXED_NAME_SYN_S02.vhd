-- =============================================================
-- Case ID: TC_INDEXED_NAME_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_INDEXED_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.4
-- Production: indexed_name ::= prefix ( expression { , expression } )
-- Case Type: Positive
-- Test Focus: 2D array indexing
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity in_spc2_ent is port(r:out integer); end entity;
architecture bh of in_spc2_ent is
  type t_mat is array(0 to 3,7 downto 0) of integer;
  signal m:t_mat:=(others=>(others=>0));
begin m(0,0)<=1; m(2,5)<=10; m(3,7)<=20; r<=m(0,0)+m(2,5)+m(3,7); end architecture bh;
