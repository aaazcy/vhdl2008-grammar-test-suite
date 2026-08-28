-- =============================================================
-- Case ID: TC_TARGET_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_TARGET
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: target ::= name | aggregate
-- Case Type: Positive
-- Test Focus: target: record field target — s_rec.field_name as signal assignment target
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity target_syn6_ent is port(x_val,y_val:in integer; y:out integer); end entity;
architecture bh of target_syn6_ent is
  type t_point is record
    x:integer; y:integer;
  end record;
  signal s_pt:t_point:=(x=>0, y=>0);
begin
  process(x_val, y_val) is
  begin
    s_pt.x <= x_val;
    s_pt.y <= y_val;
  end process;
  y <= s_pt.x + s_pt.y;
end architecture bh;
