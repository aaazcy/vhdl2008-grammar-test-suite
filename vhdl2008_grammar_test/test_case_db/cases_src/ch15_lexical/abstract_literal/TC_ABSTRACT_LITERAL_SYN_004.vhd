-- =============================================================
-- Case ID: TC_ABSTRACT_LITERAL_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ABSTRACT_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5
-- Production: abstract_literal ::= decimal_literal | based_literal
-- Case Type: Positive
-- Test Focus: abstract_literal as generic default values and port map actuals: decimal_literal integer forms(8, 16, 32) and real form(1.0) used in entity generics, integer literal and based literal(16#80#) used directly as actuals in port map associations
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity al_generic_and_portmap is
  generic (
    G_WIDTH : integer := 8;
    G_DEPTH : integer := 16;
    G_MAX   : integer := 32;
    G_THRESH: real    := 1.0
  );
  port (
    addr  : in  integer range 0 to G_DEPTH-1;
    data  : out integer range 0 to G_WIDTH*G_WIDTH-1
  );
end entity al_generic_and_portmap;

architecture rtl of al_generic_and_portmap is
  constant C_OFFSET : integer := 16#80#;
  signal s_result   : integer := 0;
begin
  s_result <= addr * G_WIDTH + C_OFFSET;
  data <= s_result;
end architecture rtl;
