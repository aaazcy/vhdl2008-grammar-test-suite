-- =============================================================
-- Case ID: TC_ASSOCIATION_LIST_SNN_004
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_ASSOCIATION_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: association_list ::= association_element
--              { , association_element }
-- Case Type: Negative
-- Test Focus: association_list — ERROR: trailing comma after the last
--             association_element. The BNF specifies zero or more
--             repetitions of ", association_element", which requires
--             each comma to be followed by an association_element.
--             A trailing comma with nothing after it is invalid.
-- Expected Result: Triggers syntax error (trailing comma)
-- Dependencies: None
-- =============================================================

entity association_list_snn4 is
  port (
    a : in  bit;
    b : out bit
  );
end entity association_list_snn4;

architecture arch of association_list_snn4 is

  component xor_gate is
    port (
      in1 : in  bit;
      in2 : in  bit;
      out1: out bit
    );
  end component;

  signal s_a : bit := '0';
  signal s_b : bit := '0';
  signal s_y : bit;

begin

  s_a <= a;
  s_b <= a;

  -- ERROR: trailing comma after the last association_element.
  -- The BNF pattern: association_element { , association_element }
  -- means each comma MUST be followed by another association_element.
  -- A comma at the end with nothing after it is a syntax error.
  u_xor : component xor_gate
    port map (
      in1  => s_a,
      in2  => s_b,
      out1 => s_y,
    );

  b <= s_y;

end architecture arch;
