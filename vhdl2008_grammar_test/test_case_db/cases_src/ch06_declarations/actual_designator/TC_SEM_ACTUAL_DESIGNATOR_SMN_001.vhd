-- =============================================================
-- Case ID: TC_SEM_ACTUAL_DESIGNATOR_SMN_001
-- Rule Type: Semantic (Negative)
-- Related Rule ID: BNF_ACTUAL_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: actual_designator ::= [ inertial ] expression | signal_name
--              | variable_name | file_name | subtype_indication
--              | subprogram_name | instantiated_package_name | open
-- Case Type: Negative (Semantic)
-- Test Focus: actual_designator — SEMANTIC ERROR: signal_name used as
--             actual_designator for a port of incompatible type.
--             The syntax is valid (signal_name is a legal alternative),
--             but the types do not match (bit_vector port vs integer signal).
-- Expected Result: Triggers semantic/elaboration error (type mismatch)
-- Dependencies: None
-- =============================================================

entity actual_designator_smn1 is
  port (
    clk    : in  bit;
    result : out bit_vector(7 downto 0)
  );
end entity actual_designator_smn1;

architecture arch of actual_designator_smn1 is

  component shift_register is
    port (
      clock   : in  bit;
      data_in : in  bit_vector(7 downto 0);
      data_out: out bit_vector(7 downto 0)
    );
  end component;

  -- SEMANTIC ERROR: s_mode is integer, but the data_in port
  -- of shift_register expects bit_vector(7 downto 0).
  -- The signal_name 's_mode' is a syntactically valid actual_designator,
  -- but the type integer cannot be associated with a bit_vector port.
  signal s_mode    : integer := 0;
  signal s_result  : bit_vector(7 downto 0);

begin

  u_shift : component shift_register
    port map (
      clock    => clk,
      data_in  => s_mode,
      data_out => s_result
    );

  result <= s_result;

end architecture arch;
