-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_declaration ::= subprogram_specification ;
-- Case Type: Negative
-- Test Focus: subprogram_declaration: procedure with mode 'variable' on signal parameter — procedure parameters in subprogram_specification with class 'signal' cannot have mode 'variable'; signal parameters must be in, out, or inout
-- Expected Result: Triggers syntax error: invalid mode for signal parameter
-- Dependencies: None
-- =============================================================
entity subprog_decl_bad_mode is
  port (
    reset : in  bit;
    q     : out bit
  );
end entity;

architecture test of subprog_decl_bad_mode is
  -- ERROR: In subprogram_specification for a procedure:
  -- procedure p_set(signal q : out bit; variable v : in integer);
  -- Signal parameters cannot have 'variable' mode — only in, out, inout

  procedure p_reset(signal q : out bit; constant level : in bit) is
  begin
    q <= level;
  end procedure;
begin
  p_reset(q, reset);
end architecture test;
