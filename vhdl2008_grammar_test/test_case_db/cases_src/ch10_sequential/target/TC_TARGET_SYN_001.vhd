-- =============================================================
-- Case ID: TC_TARGET_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_TARGET
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Production: target ::= name | aggregate
-- Case Type: Positive
-- Test Focus: Target all forms: simple name (s_val) / indexed name (s_arr(0)) / slice name (s_vec(3..0)) / record field (s_rec.x) / aggregate ((a,b,c)), verifying all name forms and aggregate forms of assignment target
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tgt_ent is port(a:in integer; y:out integer); end entity;
architecture bh of tgt_ent is
  type t_arr is array(0 to 3) of integer;
  type t_rec is record x,y:integer; end record;
  signal s_val:integer:=0; signal s_arr:t_arr:=(others=>0);
  signal s_vec:bit_vector(7 downto 0):=X"00";
  signal s_rec:t_rec:=(x=>0,y=>0);
begin
  process(a) begin
    s_val<=a; s_arr(0)<=a; s_vec(3 downto 0)<="1010"; s_rec.x<=a; (s_rec.x,s_rec.y)<=t_rec'(a,a+1);
    y<=s_val+s_arr(0)+s_rec.x+s_rec.y;
  end process;
end architecture bh;
