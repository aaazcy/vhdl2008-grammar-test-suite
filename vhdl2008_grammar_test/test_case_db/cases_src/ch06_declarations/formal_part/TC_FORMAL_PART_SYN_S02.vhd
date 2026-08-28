-- =============================================================
-- Case ID: TC_FORMAL_PART_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORMAL_PART
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: formal_part ::= formal_designator | function_name ( formal_designator ) | type_mark ( formal_designator )
-- Case Type: Positive
-- Test Focus: Production-specific: exercises formal_part with type_mark conversion in a port map formal part.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity formal_part_syn_s2 is
  port (
    a    : in  integer range 0 to 255;
    b    : in  integer range 0 to 255;
    sum  : out integer range 0 to 510
  );
end entity formal_part_syn_s2;

architecture rtl of formal_part_syn_s2 is
  component int_adder is
    port (
      op_a : in  integer range 0 to 255;
      op_b : in  integer range 0 to 255;
      result : out integer range 0 to 510
    );
  end component;
begin
  -- formal_part = formal_designator (port_name)
  u_add : int_adder
    port map (
      op_a   => a,
      op_b   => b,
      result => sum
    );
end architecture rtl;
