-- =============================================================
-- Case ID: TC_ARCHITECTURE_BODY_SYN_013
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_BODY
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_body ::= architecture identifier of entity_name is architecture_declarative_part begin architecture_statement_part end [ architecture ] [ architecture_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Guarded signal disconnect specification: declarative part contains a disconnect specification defining post-disconnection behavior for a guarded signal, a guarded block uses guarded assignment to that signal, verifying architecture_declarative_part can contain disconnect_specification and interact correctly with the guarded block
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity arch_disc_ent is
  port(a,b:in bit; y:out bit);
end entity;
architecture rtl of arch_disc_ent is
  signal s_g:bit:='1';
  function f_resolve_b(v : bit_vector) return bit is
  begin
    for i in v'range loop if v(i) = '1' then return '1'; end if; end loop;
    return '0';
  end function f_resolve_b;
  subtype r_bit is f_resolve_b bit;
  signal s_bus:r_bit register;
  disconnect s_bus:r_bit after 2 ns;
begin
  b_guarded:block(s_g='1')
  begin
    s_bus<=guarded a and b;
    y<=s_bus;
  end block;
end architecture rtl;
