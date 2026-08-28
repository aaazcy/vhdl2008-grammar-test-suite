-- =============================================================
-- Case ID: TC_LITERAL_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: literal ::= numeric_literal | enumeration_literal | string_literal | bit_string_literal | null
-- Case Type: Positive
-- Test Focus: literal: null literal assigned to access type variable for empty pointer initialization
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity literal_syn5_ent is port(y:out integer); end entity;
architecture bh of literal_syn5_ent is
  type t_int_ptr is access integer;
  signal s_val:integer:=0;
begin
  process is
    variable v_ptr:t_int_ptr:=null;
    variable v_data:integer:=42;
  begin
    v_ptr := new integer'(v_data);
    if v_ptr/=null then s_val<=v_ptr.all; end if;
    y<=s_val;
    wait;
  end process;
end architecture bh;
