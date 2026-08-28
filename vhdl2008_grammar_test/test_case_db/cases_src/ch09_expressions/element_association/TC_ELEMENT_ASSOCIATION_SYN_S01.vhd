-- =============================================================
-- Case ID: TC_ELEMENT_ASSOCIATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: element_association
-- IEEE Section: 9.3.3.1
-- BNF Text: element_association ::= [ choices => ] expression
-- Test Focus: positional element association in array aggregate (no named choices, implicit positional mapping)
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_element_association_syn_s01 is
  port (
    rd_addr : in  integer range 0 to 3;
    rd_data : out integer range 0 to 255
  );
end entity tc_element_association_syn_s01;

architecture regfile of tc_element_association_syn_s01 is
  type t_regfile is array(0 to 3) of integer range 0 to 255;
  signal regs : t_regfile := (10, 20, 30, 40);  -- positional element associations
begin
  rd_data <= regs(rd_addr);
end architecture regfile;
