-- =============================================================
-- Case ID: TC_ACTUAL_DESIGNATOR_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ACTUAL_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: actual_designator ::= [ inertial ] expression | signal_name | variable_name | file_name | subtype_indication | subprogram_name | instantiated_package_name | open
-- Case Type: Positive
-- Test Focus: Exercises actual_designator with the "open" alternative leaving unused output ports unconnected.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity actual_designator_syn5 is
  port (
    a      : in  bit_vector(3 downto 0);
    b      : in  bit_vector(3 downto 0);
    sum_lo : out bit_vector(3 downto 0)
  );
end entity actual_designator_syn5;

architecture rtl of actual_designator_syn5 is
  component full_adder_4bit is
    port (
      a    : in  bit_vector(3 downto 0);
      b    : in  bit_vector(3 downto 0);
      cin  : in  bit;
      sum  : out bit_vector(3 downto 0);
      cout : out bit;
      ovf  : out bit
    );
  end component;
begin
  u_add : full_adder_4bit
    port map (
      a    => a,
      b    => b,
      cin  => '0',
      sum  => sum_lo,
      cout => open,
      ovf  => open
    );
end architecture rtl;
