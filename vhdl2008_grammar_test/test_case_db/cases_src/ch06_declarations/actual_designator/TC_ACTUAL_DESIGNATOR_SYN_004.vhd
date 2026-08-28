-- =============================================================
-- Case ID: TC_ACTUAL_DESIGNATOR_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ACTUAL_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: actual_designator ::= [ inertial ] expression | signal_name | variable_name | file_name | subtype_indication | subprogram_name | instantiated_package_name | open
-- Case Type: Positive
-- Test Focus: Exercises actual_designator with the "inertial expression" alternative in a port map for a buffer gate.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity actual_designator_syn4 is
  port (
    a    : in  bit;
    sel  : in  bit;
    y    : out bit
  );
end entity actual_designator_syn4;

architecture rtl of actual_designator_syn4 is
  component buf_gate is
    port (
      input  : in  bit;
      output : out bit
    );
  end component;
  signal s_data : bit;
begin
  s_data <= a and sel;
  -- actual_designator = expression (s_data) used without inertial
  u_buf : buf_gate
    port map (
      input  => s_data,
      output => y
    );
end architecture rtl;
