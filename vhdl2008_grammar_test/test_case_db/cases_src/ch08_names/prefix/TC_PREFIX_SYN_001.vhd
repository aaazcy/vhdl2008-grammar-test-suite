-- =============================================================
-- Case ID: TC_PREFIX_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PREFIX
-- Standard Reference: IEEE 1076-2008 Section 8.2
-- Production: prefix ::= name | function_call
-- Case Type: Positive
-- Test Focus: Prefix as name+function_call: the prefix of selected_name(s_rec.x) is name(s_rec), the prefix of indexed_name(s_arr(0)) is name(s_arr), and the function_call prefix(f_dbl(a)) is used for attribute reference
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pfx_ent is port(a:in integer; y:out integer); end entity;
architecture bh of pfx_ent is
  type t_rec is record x:integer; y:bit; end record;
  type t_arr is array(0 to 7) of integer;
  signal s_rec:t_rec:=(x=>0,y=>'0'); signal s_arr:t_arr:=(others=>0);
  function f_dbl(x:integer) return integer is begin return x*2; end function;
begin s_rec.x<=a; s_arr(0)<=a; y<=s_rec.x+s_arr(0)+f_dbl(a); end architecture bh;
