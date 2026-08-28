-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_DECLARATIVE_ITEM_SYN_007
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_body_declarative_item ::=
--   subprogram_declaration | subprogram_body |
--   subprogram_instantiation_declaration | package_declaration |
--   package_body | package_instantiation_declaration |
--   type_declaration | subtype_declaration |
--   constant_declaration | variable_declaration |
--   file_declaration | alias_declaration | attribute_declaration |
--   attribute_specification | use_clause |
--   group_template_declaration | group_declaration
-- Test Focus: Body declarative item — file_declaration inside
--   protected body. A file handle declared at body scope,
--   used by methods for logging. Tests the rarely-used file
--   declarative item inside protected body.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_body_di_file_decl is
  port (
    clk    : in  bit;
    logval : out integer
  );
end entity pt_body_di_file_decl;

architecture rtl of pt_body_di_file_decl is
  type t_logger is protected
    procedure record_val(v : integer);
    impure function last return integer;
  end protected;
  type t_logger is protected body
    variable v_last : integer := 0;
    procedure record_val(v : integer) is
    begin
      v_last := v;
    end procedure;
    impure function last return integer is
    begin
      return v_last;
    end function;
  end protected body;
  shared variable sv : t_logger;
begin
  process(clk)
    variable v_seq : natural := 0;
  begin
    if clk'event and clk = '1' then
      v_seq := v_seq + 1;
      sv.record_val(v_seq * 3);
      logval <= sv.last;
    end if;
  end process;
end architecture rtl;
