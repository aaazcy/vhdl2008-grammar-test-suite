-- =============================================================
-- Case ID: TC_DECLARATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.1
-- Production: declaration ::= type_declaration | subtype_declaration
--   | object_declaration | interface_declaration
--   | alias_declaration | attribute_declaration
--   | component_declaration | group_template_declaration
--   | group_declaration | entity_declaration
--   | configuration_declaration | subprogram_declaration
--   | package_declaration
-- Test Focus: type, subtype, signal, constant, alias, and subprogram
--   declarations in architecture body — exercises multiple
--   declaration forms from the alternative list
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.numeric_bit.all;
entity declaration_syn_001 is
  port (
    a_in    : in  bit_vector(3 downto 0);
    b_in    : in  bit_vector(3 downto 0);
    sum_out : out bit_vector(4 downto 0)
  );
end entity declaration_syn_001;

architecture rtl of declaration_syn_001 is
  -- TYPE_DECLARATION: integer range type
  type t_nibble is range 0 to 15;

  -- SUBTYPE_DECLARATION: constrained subtype of integer
  subtype t_lsn is t_nibble range 0 to 7;

  -- OBJECT_DECLARATION: constant declaration
  constant C_CARRY_IN : t_nibble := 0;

  -- OBJECT_DECLARATION: signal declarations
  signal s_a_val : t_nibble := 0;
  signal s_b_val : t_nibble := 0;
  signal s_sum   : t_nibble := 0;

  -- ALIAS_DECLARATION: alias for a signal slice
  alias a_bit3 is s_a_val;

  -- SUBPROGRAM_DECLARATION: function computing sum
  function f_add_nibble(x, y : t_nibble; cin : t_nibble) return t_nibble is
  begin
    return x + y + cin;
  end function;

begin
  -- Convert bit_vector inputs to integer values
  s_a_val <= t_nibble(to_integer(unsigned(a_in)));
  s_b_val <= t_nibble(to_integer(unsigned(b_in)));

  -- Compute sum using declared function
  s_sum <= f_add_nibble(s_a_val, s_b_val, C_CARRY_IN);

  -- Drive output
  sum_out <= bit_vector(to_unsigned(integer(s_sum), 5));
end architecture rtl;
