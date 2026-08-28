-- =============================================================
-- Case ID: TC_INTERFACE_ELEMENT_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 6.5.4
-- Production: interface_element ::= interface_declaration
-- Case Type: Positive
-- Test Focus: Production-specific: exercises interface_element as interface_declaration in a generic interface list.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity interface_element_syn_s2 is
  generic (
    WIDTH : integer := 4
  );
  port (
    a, b : in  bit_vector(WIDTH-1 downto 0);
    y    : out bit_vector(WIDTH-1 downto 0)
  );
end entity interface_element_syn_s2;

architecture rtl of interface_element_syn_s2 is
begin
  y <= a xor b;
end architecture rtl;
