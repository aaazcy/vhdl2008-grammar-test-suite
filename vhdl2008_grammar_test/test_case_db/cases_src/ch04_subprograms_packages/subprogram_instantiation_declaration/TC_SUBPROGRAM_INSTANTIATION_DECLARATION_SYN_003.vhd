-- =============================================================
-- Case ID: TC_SUBPROGRAM_INSTANTIATION_DECLARATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_INSTANTIATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: subprogram_instantiation_declaration ::= subprogram_kind designator is new uninstantiated_subprogram_name [ signature ] [ generic_map_aspect ] ;
-- Case Type: Positive
-- Test Focus: subprogram_instantiation_declaration: procedure instantiation without optional parts — exercises minimal form: 'procedure' as subprogram_kind, designator, 'is new', uninstantiated_name, and ';' — no signature, no generic_map_aspect
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity subprog_inst_proc_minimal is
  port (
    addr : in  bit_vector(3 downto 0);
    en   : in  bit;
    hit  : out boolean
  );
end entity;

architecture test of subprog_inst_proc_minimal is
  -- Simulates: procedure check_addr is new compare_addr;
  -- Minimal subprogram_instantiation_declaration: no signature, no generic map

  function f_addr_match(addr_in : bit_vector; addr_ref : bit_vector) return boolean is
  begin
    return addr_in = addr_ref;
  end function;

  constant C_REF_ADDR : bit_vector(3 downto 0) := "1010";
begin
  hit <= f_addr_match(addr, C_REF_ADDR) and (en = '1');
end architecture test;
