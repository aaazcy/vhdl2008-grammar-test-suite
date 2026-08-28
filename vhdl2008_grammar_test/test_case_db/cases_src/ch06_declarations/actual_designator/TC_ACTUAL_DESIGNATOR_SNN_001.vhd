-- =============================================================
-- Case ID: TC_ACTUAL_DESIGNATOR_SNN_001
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_ACTUAL_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: actual_designator ::= [ inertial ] expression | signal_name
--              | variable_name | file_name | subtype_indication
--              | subprogram_name | instantiated_package_name | open
-- Case Type: Negative
-- Test Focus: actual_designator — ERROR: inertial keyword used without
--             a following expression; the BNF requires [ inertial ] expression
--             meaning inertial MUST be followed by an expression.
-- Expected Result: Triggers syntax error (missing expression after inertial)
-- Dependencies: None
-- =============================================================

entity actual_designator_snn1 is
  port (
    a : in  bit;
    b : out bit
  );
end entity actual_designator_snn1;

architecture arch of actual_designator_snn1 is

  component buf_gate is
    port (
      input  : in  bit;
      output : out bit
    );
  end component;

  signal s_data : bit := '0';

begin

  -- ERROR: 'inertial' keyword present but followed by a port name
  -- instead of an expression. The BNF requires:
  --   actual_designator ::= [ inertial ] expression
  -- which means inertial can only prefix an expression, not a signal_name.
  -- Using 'inertial s_data' where s_data is a signal_name is ambiguous
  -- because the BNF does not allow [ inertial ] signal_name.
  u_buf : component buf_gate
    port map (
      input  => a,
      output => inertial
    );

end architecture arch;
