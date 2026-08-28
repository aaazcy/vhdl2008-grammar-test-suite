-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_declaration ::= subprogram_specification ;
-- Case Type: Positive
-- Test Focus: subprogram_declaration: impure function specification — exercises function_specification with 'impure' keyword, showing that both 'pure' (default) and 'impure' are valid in subprogram_specification within a subprogram_declaration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity subprog_decl_impure is
  port (
    seed_in  : in  positive;
    rand_out : out natural
  );
end entity;

architecture test of subprog_decl_impure is
  -- subprogram_declaration: impure function subprogram_specification ;
  impure function f_lcg(seed : in positive) return natural;

  impure function f_lcg(seed : in positive) return natural is
    variable v_state : natural := seed;
  begin
    v_state := (v_state * 1103515245 + 12345) mod 2**31;
    return v_state;
  end function;
begin
  rand_out <= f_lcg(seed_in);
end architecture test;
