-- =============================================================
-- Case ID: TC_ELEMENT_ASSOCIATION_SNN_003
-- Rule Type: Syntax
-- BNF Production: element_association
-- IEEE Section: 9.3.3.1
-- BNF Text: element_association ::= [ choices => ] expression
-- Test Focus: type mismatch in element association - non-matching element type in record aggregate
-- Case Type: Negative
-- Expected Result: Triggers semantic error (type of expression does not match element type)
-- Dependencies: None
-- =============================================================
entity tc_element_association_snn_003 is
  port (
    valid : out bit
  );
end entity tc_element_association_snn_003;

architecture error of tc_element_association_snn_003 is
  type t_cfg is record
    mode  : integer range 0 to 7;
    flags : bit_vector(3 downto 0);
  end record t_cfg;

  signal config : t_cfg;
begin
  -- ERROR: '1' is bit, not bit_vector - wrong type for 'flags' field
  config <= (mode => 3, flags => '1');
  valid <= '1' when config.mode > 0 else '0';
end architecture error;
