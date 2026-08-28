-- =============================================================
-- Case ID: TC_SUBTYPE_DECLARATION_SYN_S03
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBTYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: subtype_declaration ::= subtype identifier is subtype_indication ;
-- Case Type: Positive
-- Test Focus: enum subtype with range
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sub_spc3_ent is port(r:out integer); end entity;
architecture bh of sub_spc3_ent is
  type t_st is (IDLE,RUN,HOLD,STOP,ERR);
  subtype t_active is t_st range RUN to STOP;
  signal a:t_active:=RUN;
begin a<=STOP; r<=t_st'pos(a); end architecture bh;
