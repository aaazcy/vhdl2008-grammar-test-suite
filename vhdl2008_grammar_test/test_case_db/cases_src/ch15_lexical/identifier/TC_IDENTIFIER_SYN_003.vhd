-- =============================================================
-- Case ID: TC_IDENTIFIER_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_IDENTIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.4.2
-- Production: identifier ::= basic_identifier | extended_identifier
-- Case Type: Positive
-- Test Focus: Entity and signal declarations using only basic_identifier — testing identifier derivation via the basic_identifier branch, underscore legally embedded
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity id_basic_only is
  port (
    data_bus_in  : in  integer;
    result_out   : out integer
  );
end entity id_basic_only;

architecture rtl of id_basic_only is
  signal internal_reg : integer := 0;
  signal next_val     : integer := 5;
begin
  internal_reg <= next_val + data_bus_in;
  result_out   <= internal_reg;
end architecture rtl;
