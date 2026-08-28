-- =============================================================
-- Case ID: TC_CONDITIONAL_EXPRESSIONS_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: conditional_expressions ::= expression when condition { else expression when condition } [ else expression ]
-- Case Type: Positive
-- Test Focus: conditional_expressions: in port map actual with when-else chain selecting different constants
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cond_expr_syn8_ent is port(cfg:in integer range 0 to 2; y:out integer); end entity;
architecture bh of cond_expr_syn8_ent is
  constant C_FAST:integer:=100;
  constant C_SLOW:integer:=200;
  constant C_DEF:integer:=150;
  signal s_cfg:integer;
begin
  s_cfg <= C_FAST when cfg=0 else C_SLOW when cfg=1 else C_DEF;
  y <= s_cfg;
end architecture bh;
