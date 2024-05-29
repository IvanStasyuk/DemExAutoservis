using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace DemExAutoservis.Pages
{
    /// <summary>
    /// Логика взаимодействия для PlaceMasterEnter.xaml
    /// </summary>
    public partial class PlaceMasterEnter : Page
    {
        public PlaceMasterEnter()
        {
            InitializeComponent();
            ListUsersGrid.ItemsSource = name_databaseEntities.GetContext().user.ToList();
        }

        private void AddUser_Click(object sender, RoutedEventArgs e)
        {
            Manager.myFrame.Navigate(new Pages.RegistrationUser());
        }
    }
}
