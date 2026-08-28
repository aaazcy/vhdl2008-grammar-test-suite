-- =============================================================
-- Case ID: TC_ACTUAL_DESIGNATOR_SNN_004
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_ACTUAL_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: actual_designator ::= [ inertial ] expression | signal_name
--              | variable_name | file_name | subtype_indication
--              | subprogram_name | instantiated_package_name | open
-- Case Type: Negative
-- Test Focus: actual_designator — ERROR: using a type_mark (bit_vector)
--             in a position where actual_designator is expected.
--             type_mark is NOT one of the actual_designator alternatives;
--             it belongs to actual_part, not actual_designator.
-- Expected Result: Triggers syntax error (type_mark not valid as actual_designator)
-- Dependencies: None
-- =============================================================

entity actual_designator_snn4 is
  port (
    input  : in  bit;
    output : out bit
  );
end entity actual_designator_snn4;

architecture arch of actual_designator_snn4 is

  component inv_gate is
    port (
      a : in  bit;
      y : out bit
    );
  end component;

  signal s_int : integer := 0;
  signal s_bit : bit := '0';

begin

  -- ERROR: bit_vector is a type_mark, not a valid actual_designator.
  -- The BNF for actual_designator does NOT include type_mark.
  -- type_mark only appears in:
  --   actual_part ::= ... | type_mark ( actual_designator )
  -- Using bit_vector here as a bare actual_designator is illegal.
  u_inv : component inv_gate
    port map (
      a => bit_vector,
      y => output
    );

end architecture arch;
