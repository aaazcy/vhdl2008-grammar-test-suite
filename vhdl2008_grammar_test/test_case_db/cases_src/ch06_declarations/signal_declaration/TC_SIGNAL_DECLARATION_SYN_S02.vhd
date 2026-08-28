-- =============================================================
-- Case ID: TC_SIGNAL_DECLARATION_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.3
-- Production: signal_declaration ::= signal identifier_list : subtype_indication [ signal_kind ] [ := expression ] ;
-- Case Type: Positive
-- Test Focus: register and bus signal kinds
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sig_spc2_ent is port(r:out integer); end entity;
architecture bh of sig_spc2_ent is
  function resolve_bit(x : bit_vector) return bit is
  begin
    for i in x'range loop
      if x(i) = '1' then return '1'; end if;
    end loop;
    return '0';
  end function;
  subtype rbit is resolve_bit bit;
  signal s_reg : rbit register;
  signal s_bus : rbit bus;
begin
  b_guard : block (true)
  begin
    s_reg <= guarded '1';
    s_bus <= guarded null;
  end block;
  r <= 1;
end architecture bh;
